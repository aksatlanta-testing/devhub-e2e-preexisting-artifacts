
{{- define "go-echoef5e6d49-128c-4e4c-bee8-d1c37d4466d2.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoef5e6d49-128c-4e4c-bee8-d1c37d4466d2.fullname" -}}
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


{{- define "go-echoef5e6d49-128c-4e4c-bee8-d1c37d4466d2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoef5e6d49-128c-4e4c-bee8-d1c37d4466d2.labels" -}}
helm.sh/chart: {{ include "go-echoef5e6d49-128c-4e4c-bee8-d1c37d4466d2.chart" . }}
{{ include "go-echoef5e6d49-128c-4e4c-bee8-d1c37d4466d2.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoef5e6d49-128c-4e4c-bee8-d1c37d4466d2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoef5e6d49-128c-4e4c-bee8-d1c37d4466d2.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}