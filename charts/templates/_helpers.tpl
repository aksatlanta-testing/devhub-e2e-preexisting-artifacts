
{{- define "go-echo169c46e9-338c-4f8c-a5b4-cf048513a60c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo169c46e9-338c-4f8c-a5b4-cf048513a60c.fullname" -}}
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


{{- define "go-echo169c46e9-338c-4f8c-a5b4-cf048513a60c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo169c46e9-338c-4f8c-a5b4-cf048513a60c.labels" -}}
helm.sh/chart: {{ include "go-echo169c46e9-338c-4f8c-a5b4-cf048513a60c.chart" . }}
{{ include "go-echo169c46e9-338c-4f8c-a5b4-cf048513a60c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo169c46e9-338c-4f8c-a5b4-cf048513a60c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo169c46e9-338c-4f8c-a5b4-cf048513a60c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}