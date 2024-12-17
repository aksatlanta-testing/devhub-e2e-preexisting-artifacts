
{{- define "go-echo0b57f918-3b00-4cc9-b758-7e61f3254b3b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0b57f918-3b00-4cc9-b758-7e61f3254b3b.fullname" -}}
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


{{- define "go-echo0b57f918-3b00-4cc9-b758-7e61f3254b3b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0b57f918-3b00-4cc9-b758-7e61f3254b3b.labels" -}}
helm.sh/chart: {{ include "go-echo0b57f918-3b00-4cc9-b758-7e61f3254b3b.chart" . }}
{{ include "go-echo0b57f918-3b00-4cc9-b758-7e61f3254b3b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0b57f918-3b00-4cc9-b758-7e61f3254b3b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0b57f918-3b00-4cc9-b758-7e61f3254b3b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}