
{{- define "go-echoff775eb6-d9d7-4d2d-95f8-20c59713b73f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff775eb6-d9d7-4d2d-95f8-20c59713b73f.fullname" -}}
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


{{- define "go-echoff775eb6-d9d7-4d2d-95f8-20c59713b73f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff775eb6-d9d7-4d2d-95f8-20c59713b73f.labels" -}}
helm.sh/chart: {{ include "go-echoff775eb6-d9d7-4d2d-95f8-20c59713b73f.chart" . }}
{{ include "go-echoff775eb6-d9d7-4d2d-95f8-20c59713b73f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoff775eb6-d9d7-4d2d-95f8-20c59713b73f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoff775eb6-d9d7-4d2d-95f8-20c59713b73f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}