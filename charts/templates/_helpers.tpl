
{{- define "go-echo545a8899-78ef-4b0d-9b55-411052bbb696.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo545a8899-78ef-4b0d-9b55-411052bbb696.fullname" -}}
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


{{- define "go-echo545a8899-78ef-4b0d-9b55-411052bbb696.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo545a8899-78ef-4b0d-9b55-411052bbb696.labels" -}}
helm.sh/chart: {{ include "go-echo545a8899-78ef-4b0d-9b55-411052bbb696.chart" . }}
{{ include "go-echo545a8899-78ef-4b0d-9b55-411052bbb696.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo545a8899-78ef-4b0d-9b55-411052bbb696.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo545a8899-78ef-4b0d-9b55-411052bbb696.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}