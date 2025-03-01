
{{- define "go-echo6acc0416-12b9-4d1a-9d2f-9a888d7a4c43.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6acc0416-12b9-4d1a-9d2f-9a888d7a4c43.fullname" -}}
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


{{- define "go-echo6acc0416-12b9-4d1a-9d2f-9a888d7a4c43.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6acc0416-12b9-4d1a-9d2f-9a888d7a4c43.labels" -}}
helm.sh/chart: {{ include "go-echo6acc0416-12b9-4d1a-9d2f-9a888d7a4c43.chart" . }}
{{ include "go-echo6acc0416-12b9-4d1a-9d2f-9a888d7a4c43.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6acc0416-12b9-4d1a-9d2f-9a888d7a4c43.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6acc0416-12b9-4d1a-9d2f-9a888d7a4c43.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}