
{{- define "go-echocce77ae9-5133-4085-9c83-d25bc3f28d0b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocce77ae9-5133-4085-9c83-d25bc3f28d0b.fullname" -}}
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


{{- define "go-echocce77ae9-5133-4085-9c83-d25bc3f28d0b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocce77ae9-5133-4085-9c83-d25bc3f28d0b.labels" -}}
helm.sh/chart: {{ include "go-echocce77ae9-5133-4085-9c83-d25bc3f28d0b.chart" . }}
{{ include "go-echocce77ae9-5133-4085-9c83-d25bc3f28d0b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocce77ae9-5133-4085-9c83-d25bc3f28d0b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocce77ae9-5133-4085-9c83-d25bc3f28d0b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}