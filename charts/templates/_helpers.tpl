
{{- define "go-echobc68579a-ecd8-42d6-811c-5e69d2c84951.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc68579a-ecd8-42d6-811c-5e69d2c84951.fullname" -}}
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


{{- define "go-echobc68579a-ecd8-42d6-811c-5e69d2c84951.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc68579a-ecd8-42d6-811c-5e69d2c84951.labels" -}}
helm.sh/chart: {{ include "go-echobc68579a-ecd8-42d6-811c-5e69d2c84951.chart" . }}
{{ include "go-echobc68579a-ecd8-42d6-811c-5e69d2c84951.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobc68579a-ecd8-42d6-811c-5e69d2c84951.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobc68579a-ecd8-42d6-811c-5e69d2c84951.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}