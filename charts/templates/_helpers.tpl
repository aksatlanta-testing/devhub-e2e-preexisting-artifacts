
{{- define "go-echo9a1c6a32-deac-4330-910d-ee0c55acf221.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9a1c6a32-deac-4330-910d-ee0c55acf221.fullname" -}}
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


{{- define "go-echo9a1c6a32-deac-4330-910d-ee0c55acf221.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9a1c6a32-deac-4330-910d-ee0c55acf221.labels" -}}
helm.sh/chart: {{ include "go-echo9a1c6a32-deac-4330-910d-ee0c55acf221.chart" . }}
{{ include "go-echo9a1c6a32-deac-4330-910d-ee0c55acf221.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9a1c6a32-deac-4330-910d-ee0c55acf221.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9a1c6a32-deac-4330-910d-ee0c55acf221.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}