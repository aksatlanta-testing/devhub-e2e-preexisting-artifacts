
{{- define "go-echo99034cb7-b98d-4394-b10f-dde3ddbbfffa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo99034cb7-b98d-4394-b10f-dde3ddbbfffa.fullname" -}}
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


{{- define "go-echo99034cb7-b98d-4394-b10f-dde3ddbbfffa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo99034cb7-b98d-4394-b10f-dde3ddbbfffa.labels" -}}
helm.sh/chart: {{ include "go-echo99034cb7-b98d-4394-b10f-dde3ddbbfffa.chart" . }}
{{ include "go-echo99034cb7-b98d-4394-b10f-dde3ddbbfffa.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo99034cb7-b98d-4394-b10f-dde3ddbbfffa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo99034cb7-b98d-4394-b10f-dde3ddbbfffa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}