
{{- define "go-echocd6732f0-ed87-4f17-b5c3-04316591295f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocd6732f0-ed87-4f17-b5c3-04316591295f.fullname" -}}
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


{{- define "go-echocd6732f0-ed87-4f17-b5c3-04316591295f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocd6732f0-ed87-4f17-b5c3-04316591295f.labels" -}}
helm.sh/chart: {{ include "go-echocd6732f0-ed87-4f17-b5c3-04316591295f.chart" . }}
{{ include "go-echocd6732f0-ed87-4f17-b5c3-04316591295f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocd6732f0-ed87-4f17-b5c3-04316591295f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocd6732f0-ed87-4f17-b5c3-04316591295f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}