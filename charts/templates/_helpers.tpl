
{{- define "go-echobee57dbb-65aa-4764-a118-89e7ae6a874a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobee57dbb-65aa-4764-a118-89e7ae6a874a.fullname" -}}
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


{{- define "go-echobee57dbb-65aa-4764-a118-89e7ae6a874a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobee57dbb-65aa-4764-a118-89e7ae6a874a.labels" -}}
helm.sh/chart: {{ include "go-echobee57dbb-65aa-4764-a118-89e7ae6a874a.chart" . }}
{{ include "go-echobee57dbb-65aa-4764-a118-89e7ae6a874a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobee57dbb-65aa-4764-a118-89e7ae6a874a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobee57dbb-65aa-4764-a118-89e7ae6a874a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}