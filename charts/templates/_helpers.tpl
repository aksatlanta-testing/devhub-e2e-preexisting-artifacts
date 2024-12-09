
{{- define "go-echof86bf5b6-6413-4087-9fc7-d1cdd7300004.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof86bf5b6-6413-4087-9fc7-d1cdd7300004.fullname" -}}
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


{{- define "go-echof86bf5b6-6413-4087-9fc7-d1cdd7300004.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof86bf5b6-6413-4087-9fc7-d1cdd7300004.labels" -}}
helm.sh/chart: {{ include "go-echof86bf5b6-6413-4087-9fc7-d1cdd7300004.chart" . }}
{{ include "go-echof86bf5b6-6413-4087-9fc7-d1cdd7300004.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof86bf5b6-6413-4087-9fc7-d1cdd7300004.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof86bf5b6-6413-4087-9fc7-d1cdd7300004.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}