
{{- define "go-echo5a890059-314a-40fa-828b-a442400688ea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5a890059-314a-40fa-828b-a442400688ea.fullname" -}}
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


{{- define "go-echo5a890059-314a-40fa-828b-a442400688ea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5a890059-314a-40fa-828b-a442400688ea.labels" -}}
helm.sh/chart: {{ include "go-echo5a890059-314a-40fa-828b-a442400688ea.chart" . }}
{{ include "go-echo5a890059-314a-40fa-828b-a442400688ea.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5a890059-314a-40fa-828b-a442400688ea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5a890059-314a-40fa-828b-a442400688ea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}