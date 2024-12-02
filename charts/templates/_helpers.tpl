
{{- define "go-echo465870c0-64ad-4680-ae62-e7ae4eef415a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo465870c0-64ad-4680-ae62-e7ae4eef415a.fullname" -}}
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


{{- define "go-echo465870c0-64ad-4680-ae62-e7ae4eef415a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo465870c0-64ad-4680-ae62-e7ae4eef415a.labels" -}}
helm.sh/chart: {{ include "go-echo465870c0-64ad-4680-ae62-e7ae4eef415a.chart" . }}
{{ include "go-echo465870c0-64ad-4680-ae62-e7ae4eef415a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo465870c0-64ad-4680-ae62-e7ae4eef415a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo465870c0-64ad-4680-ae62-e7ae4eef415a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}