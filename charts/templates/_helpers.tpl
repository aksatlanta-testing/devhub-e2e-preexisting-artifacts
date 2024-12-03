
{{- define "go-echo69e91b9e-fff9-4a7c-a08f-09c5485ffb09.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo69e91b9e-fff9-4a7c-a08f-09c5485ffb09.fullname" -}}
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


{{- define "go-echo69e91b9e-fff9-4a7c-a08f-09c5485ffb09.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo69e91b9e-fff9-4a7c-a08f-09c5485ffb09.labels" -}}
helm.sh/chart: {{ include "go-echo69e91b9e-fff9-4a7c-a08f-09c5485ffb09.chart" . }}
{{ include "go-echo69e91b9e-fff9-4a7c-a08f-09c5485ffb09.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo69e91b9e-fff9-4a7c-a08f-09c5485ffb09.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo69e91b9e-fff9-4a7c-a08f-09c5485ffb09.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}