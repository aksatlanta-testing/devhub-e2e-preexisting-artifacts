
{{- define "go-echo71193c58-1650-4dd9-a94d-c2ced602e264.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo71193c58-1650-4dd9-a94d-c2ced602e264.fullname" -}}
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


{{- define "go-echo71193c58-1650-4dd9-a94d-c2ced602e264.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo71193c58-1650-4dd9-a94d-c2ced602e264.labels" -}}
helm.sh/chart: {{ include "go-echo71193c58-1650-4dd9-a94d-c2ced602e264.chart" . }}
{{ include "go-echo71193c58-1650-4dd9-a94d-c2ced602e264.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo71193c58-1650-4dd9-a94d-c2ced602e264.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo71193c58-1650-4dd9-a94d-c2ced602e264.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}