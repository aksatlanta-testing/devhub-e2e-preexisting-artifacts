
{{- define "go-echoc7a24d30-433b-443f-8d49-5c74014241db.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc7a24d30-433b-443f-8d49-5c74014241db.fullname" -}}
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


{{- define "go-echoc7a24d30-433b-443f-8d49-5c74014241db.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc7a24d30-433b-443f-8d49-5c74014241db.labels" -}}
helm.sh/chart: {{ include "go-echoc7a24d30-433b-443f-8d49-5c74014241db.chart" . }}
{{ include "go-echoc7a24d30-433b-443f-8d49-5c74014241db.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc7a24d30-433b-443f-8d49-5c74014241db.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc7a24d30-433b-443f-8d49-5c74014241db.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}