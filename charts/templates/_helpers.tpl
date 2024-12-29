
{{- define "go-echocfff0926-2eed-48fe-bbdf-dc05471e3e62.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfff0926-2eed-48fe-bbdf-dc05471e3e62.fullname" -}}
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


{{- define "go-echocfff0926-2eed-48fe-bbdf-dc05471e3e62.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfff0926-2eed-48fe-bbdf-dc05471e3e62.labels" -}}
helm.sh/chart: {{ include "go-echocfff0926-2eed-48fe-bbdf-dc05471e3e62.chart" . }}
{{ include "go-echocfff0926-2eed-48fe-bbdf-dc05471e3e62.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocfff0926-2eed-48fe-bbdf-dc05471e3e62.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocfff0926-2eed-48fe-bbdf-dc05471e3e62.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}