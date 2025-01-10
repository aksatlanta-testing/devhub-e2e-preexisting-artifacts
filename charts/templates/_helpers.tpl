
{{- define "go-echoa984bbdd-e9f9-4b69-ba76-e3568ca66b5f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa984bbdd-e9f9-4b69-ba76-e3568ca66b5f.fullname" -}}
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


{{- define "go-echoa984bbdd-e9f9-4b69-ba76-e3568ca66b5f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa984bbdd-e9f9-4b69-ba76-e3568ca66b5f.labels" -}}
helm.sh/chart: {{ include "go-echoa984bbdd-e9f9-4b69-ba76-e3568ca66b5f.chart" . }}
{{ include "go-echoa984bbdd-e9f9-4b69-ba76-e3568ca66b5f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa984bbdd-e9f9-4b69-ba76-e3568ca66b5f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa984bbdd-e9f9-4b69-ba76-e3568ca66b5f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}