
{{- define "go-echoacfdee06-49ef-4e9d-93de-de3605eff282.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoacfdee06-49ef-4e9d-93de-de3605eff282.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoacfdee06-49ef-4e9d-93de-de3605eff282.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoacfdee06-49ef-4e9d-93de-de3605eff282.labels" -}}
helm.sh/chart: {{ include "go-echoacfdee06-49ef-4e9d-93de-de3605eff282.chart" . }}
{{ include "go-echoacfdee06-49ef-4e9d-93de-de3605eff282.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoacfdee06-49ef-4e9d-93de-de3605eff282.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoacfdee06-49ef-4e9d-93de-de3605eff282.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}