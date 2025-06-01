
{{- define "go-echoda374906-0ac1-4d45-8b01-0c4db2c50c6d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda374906-0ac1-4d45-8b01-0c4db2c50c6d.fullname" -}}
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


{{- define "go-echoda374906-0ac1-4d45-8b01-0c4db2c50c6d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda374906-0ac1-4d45-8b01-0c4db2c50c6d.labels" -}}
helm.sh/chart: {{ include "go-echoda374906-0ac1-4d45-8b01-0c4db2c50c6d.chart" . }}
{{ include "go-echoda374906-0ac1-4d45-8b01-0c4db2c50c6d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoda374906-0ac1-4d45-8b01-0c4db2c50c6d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoda374906-0ac1-4d45-8b01-0c4db2c50c6d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}