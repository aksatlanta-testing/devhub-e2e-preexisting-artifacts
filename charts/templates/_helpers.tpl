
{{- define "go-echo788a0a12-c69c-4566-a96b-697c99a4d478.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo788a0a12-c69c-4566-a96b-697c99a4d478.fullname" -}}
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


{{- define "go-echo788a0a12-c69c-4566-a96b-697c99a4d478.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo788a0a12-c69c-4566-a96b-697c99a4d478.labels" -}}
helm.sh/chart: {{ include "go-echo788a0a12-c69c-4566-a96b-697c99a4d478.chart" . }}
{{ include "go-echo788a0a12-c69c-4566-a96b-697c99a4d478.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo788a0a12-c69c-4566-a96b-697c99a4d478.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo788a0a12-c69c-4566-a96b-697c99a4d478.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}