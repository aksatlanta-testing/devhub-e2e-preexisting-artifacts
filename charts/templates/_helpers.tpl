
{{- define "go-echoce1b4942-72a9-4cba-9602-f2248da13dac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce1b4942-72a9-4cba-9602-f2248da13dac.fullname" -}}
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


{{- define "go-echoce1b4942-72a9-4cba-9602-f2248da13dac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce1b4942-72a9-4cba-9602-f2248da13dac.labels" -}}
helm.sh/chart: {{ include "go-echoce1b4942-72a9-4cba-9602-f2248da13dac.chart" . }}
{{ include "go-echoce1b4942-72a9-4cba-9602-f2248da13dac.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoce1b4942-72a9-4cba-9602-f2248da13dac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoce1b4942-72a9-4cba-9602-f2248da13dac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}