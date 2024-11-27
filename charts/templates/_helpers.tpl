
{{- define "go-echoc9bb933b-0009-46bf-8a21-c57eaa2eca99.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc9bb933b-0009-46bf-8a21-c57eaa2eca99.fullname" -}}
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


{{- define "go-echoc9bb933b-0009-46bf-8a21-c57eaa2eca99.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc9bb933b-0009-46bf-8a21-c57eaa2eca99.labels" -}}
helm.sh/chart: {{ include "go-echoc9bb933b-0009-46bf-8a21-c57eaa2eca99.chart" . }}
{{ include "go-echoc9bb933b-0009-46bf-8a21-c57eaa2eca99.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc9bb933b-0009-46bf-8a21-c57eaa2eca99.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc9bb933b-0009-46bf-8a21-c57eaa2eca99.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}