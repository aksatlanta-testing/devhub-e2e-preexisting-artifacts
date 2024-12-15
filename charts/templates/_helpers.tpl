
{{- define "go-echocabc6c03-c234-4500-90e3-db97d8265b69.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocabc6c03-c234-4500-90e3-db97d8265b69.fullname" -}}
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


{{- define "go-echocabc6c03-c234-4500-90e3-db97d8265b69.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocabc6c03-c234-4500-90e3-db97d8265b69.labels" -}}
helm.sh/chart: {{ include "go-echocabc6c03-c234-4500-90e3-db97d8265b69.chart" . }}
{{ include "go-echocabc6c03-c234-4500-90e3-db97d8265b69.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocabc6c03-c234-4500-90e3-db97d8265b69.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocabc6c03-c234-4500-90e3-db97d8265b69.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}