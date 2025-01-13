
{{- define "go-echo6d9c1a98-7e8f-4395-a65a-43507ed752ab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6d9c1a98-7e8f-4395-a65a-43507ed752ab.fullname" -}}
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


{{- define "go-echo6d9c1a98-7e8f-4395-a65a-43507ed752ab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6d9c1a98-7e8f-4395-a65a-43507ed752ab.labels" -}}
helm.sh/chart: {{ include "go-echo6d9c1a98-7e8f-4395-a65a-43507ed752ab.chart" . }}
{{ include "go-echo6d9c1a98-7e8f-4395-a65a-43507ed752ab.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6d9c1a98-7e8f-4395-a65a-43507ed752ab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6d9c1a98-7e8f-4395-a65a-43507ed752ab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}