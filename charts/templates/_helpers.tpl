
{{- define "go-echoed814044-22fe-4779-8544-640912b66732.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed814044-22fe-4779-8544-640912b66732.fullname" -}}
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


{{- define "go-echoed814044-22fe-4779-8544-640912b66732.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed814044-22fe-4779-8544-640912b66732.labels" -}}
helm.sh/chart: {{ include "go-echoed814044-22fe-4779-8544-640912b66732.chart" . }}
{{ include "go-echoed814044-22fe-4779-8544-640912b66732.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoed814044-22fe-4779-8544-640912b66732.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoed814044-22fe-4779-8544-640912b66732.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}