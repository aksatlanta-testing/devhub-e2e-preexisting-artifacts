
{{- define "go-echo080afdd4-530d-4d5f-be57-58a3acf1a1bb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo080afdd4-530d-4d5f-be57-58a3acf1a1bb.fullname" -}}
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


{{- define "go-echo080afdd4-530d-4d5f-be57-58a3acf1a1bb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo080afdd4-530d-4d5f-be57-58a3acf1a1bb.labels" -}}
helm.sh/chart: {{ include "go-echo080afdd4-530d-4d5f-be57-58a3acf1a1bb.chart" . }}
{{ include "go-echo080afdd4-530d-4d5f-be57-58a3acf1a1bb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo080afdd4-530d-4d5f-be57-58a3acf1a1bb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo080afdd4-530d-4d5f-be57-58a3acf1a1bb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}