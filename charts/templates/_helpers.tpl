
{{- define "go-echo44d5b73d-c652-4d73-a520-2026adc3b9ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo44d5b73d-c652-4d73-a520-2026adc3b9ee.fullname" -}}
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


{{- define "go-echo44d5b73d-c652-4d73-a520-2026adc3b9ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo44d5b73d-c652-4d73-a520-2026adc3b9ee.labels" -}}
helm.sh/chart: {{ include "go-echo44d5b73d-c652-4d73-a520-2026adc3b9ee.chart" . }}
{{ include "go-echo44d5b73d-c652-4d73-a520-2026adc3b9ee.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo44d5b73d-c652-4d73-a520-2026adc3b9ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo44d5b73d-c652-4d73-a520-2026adc3b9ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}