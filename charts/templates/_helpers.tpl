
{{- define "go-echo73f2f3e2-f37b-4a84-bf28-a9dc63a73f00.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo73f2f3e2-f37b-4a84-bf28-a9dc63a73f00.fullname" -}}
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


{{- define "go-echo73f2f3e2-f37b-4a84-bf28-a9dc63a73f00.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo73f2f3e2-f37b-4a84-bf28-a9dc63a73f00.labels" -}}
helm.sh/chart: {{ include "go-echo73f2f3e2-f37b-4a84-bf28-a9dc63a73f00.chart" . }}
{{ include "go-echo73f2f3e2-f37b-4a84-bf28-a9dc63a73f00.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo73f2f3e2-f37b-4a84-bf28-a9dc63a73f00.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo73f2f3e2-f37b-4a84-bf28-a9dc63a73f00.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}