
{{- define "go-echoac016d71-e353-45e5-b86b-5ead94f6539c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac016d71-e353-45e5-b86b-5ead94f6539c.fullname" -}}
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


{{- define "go-echoac016d71-e353-45e5-b86b-5ead94f6539c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac016d71-e353-45e5-b86b-5ead94f6539c.labels" -}}
helm.sh/chart: {{ include "go-echoac016d71-e353-45e5-b86b-5ead94f6539c.chart" . }}
{{ include "go-echoac016d71-e353-45e5-b86b-5ead94f6539c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac016d71-e353-45e5-b86b-5ead94f6539c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac016d71-e353-45e5-b86b-5ead94f6539c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}