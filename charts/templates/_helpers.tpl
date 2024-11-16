
{{- define "go-echoee793e09-a263-4b46-b5e4-6ed9a2f69235.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee793e09-a263-4b46-b5e4-6ed9a2f69235.fullname" -}}
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


{{- define "go-echoee793e09-a263-4b46-b5e4-6ed9a2f69235.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee793e09-a263-4b46-b5e4-6ed9a2f69235.labels" -}}
helm.sh/chart: {{ include "go-echoee793e09-a263-4b46-b5e4-6ed9a2f69235.chart" . }}
{{ include "go-echoee793e09-a263-4b46-b5e4-6ed9a2f69235.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoee793e09-a263-4b46-b5e4-6ed9a2f69235.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoee793e09-a263-4b46-b5e4-6ed9a2f69235.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}