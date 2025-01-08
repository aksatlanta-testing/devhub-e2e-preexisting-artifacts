
{{- define "go-echo4f6ed17c-b64a-4645-abdd-4c157a95375f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4f6ed17c-b64a-4645-abdd-4c157a95375f.fullname" -}}
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


{{- define "go-echo4f6ed17c-b64a-4645-abdd-4c157a95375f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4f6ed17c-b64a-4645-abdd-4c157a95375f.labels" -}}
helm.sh/chart: {{ include "go-echo4f6ed17c-b64a-4645-abdd-4c157a95375f.chart" . }}
{{ include "go-echo4f6ed17c-b64a-4645-abdd-4c157a95375f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4f6ed17c-b64a-4645-abdd-4c157a95375f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4f6ed17c-b64a-4645-abdd-4c157a95375f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}