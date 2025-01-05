
{{- define "go-echo43685fc4-7b6c-444b-9554-b9013d0f0eff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo43685fc4-7b6c-444b-9554-b9013d0f0eff.fullname" -}}
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


{{- define "go-echo43685fc4-7b6c-444b-9554-b9013d0f0eff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo43685fc4-7b6c-444b-9554-b9013d0f0eff.labels" -}}
helm.sh/chart: {{ include "go-echo43685fc4-7b6c-444b-9554-b9013d0f0eff.chart" . }}
{{ include "go-echo43685fc4-7b6c-444b-9554-b9013d0f0eff.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo43685fc4-7b6c-444b-9554-b9013d0f0eff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo43685fc4-7b6c-444b-9554-b9013d0f0eff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}