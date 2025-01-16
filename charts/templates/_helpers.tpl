
{{- define "go-echoe97ef24f-9d23-4d5c-8c79-22279905da0f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe97ef24f-9d23-4d5c-8c79-22279905da0f.fullname" -}}
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


{{- define "go-echoe97ef24f-9d23-4d5c-8c79-22279905da0f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe97ef24f-9d23-4d5c-8c79-22279905da0f.labels" -}}
helm.sh/chart: {{ include "go-echoe97ef24f-9d23-4d5c-8c79-22279905da0f.chart" . }}
{{ include "go-echoe97ef24f-9d23-4d5c-8c79-22279905da0f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe97ef24f-9d23-4d5c-8c79-22279905da0f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe97ef24f-9d23-4d5c-8c79-22279905da0f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}