
{{- define "go-echo31ca9ea6-9ccc-4584-a7c7-ddfcd8b5d83e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo31ca9ea6-9ccc-4584-a7c7-ddfcd8b5d83e.fullname" -}}
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


{{- define "go-echo31ca9ea6-9ccc-4584-a7c7-ddfcd8b5d83e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo31ca9ea6-9ccc-4584-a7c7-ddfcd8b5d83e.labels" -}}
helm.sh/chart: {{ include "go-echo31ca9ea6-9ccc-4584-a7c7-ddfcd8b5d83e.chart" . }}
{{ include "go-echo31ca9ea6-9ccc-4584-a7c7-ddfcd8b5d83e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo31ca9ea6-9ccc-4584-a7c7-ddfcd8b5d83e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo31ca9ea6-9ccc-4584-a7c7-ddfcd8b5d83e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}