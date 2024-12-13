
{{- define "go-echobe232637-a338-4b6c-931c-053afe653e02.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobe232637-a338-4b6c-931c-053afe653e02.fullname" -}}
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


{{- define "go-echobe232637-a338-4b6c-931c-053afe653e02.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobe232637-a338-4b6c-931c-053afe653e02.labels" -}}
helm.sh/chart: {{ include "go-echobe232637-a338-4b6c-931c-053afe653e02.chart" . }}
{{ include "go-echobe232637-a338-4b6c-931c-053afe653e02.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobe232637-a338-4b6c-931c-053afe653e02.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobe232637-a338-4b6c-931c-053afe653e02.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}