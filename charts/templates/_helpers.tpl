
{{- define "go-echob5d7ae99-6ffa-4a4c-a81a-e1cf4ba6cfa0.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob5d7ae99-6ffa-4a4c-a81a-e1cf4ba6cfa0.fullname" -}}
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


{{- define "go-echob5d7ae99-6ffa-4a4c-a81a-e1cf4ba6cfa0.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob5d7ae99-6ffa-4a4c-a81a-e1cf4ba6cfa0.labels" -}}
helm.sh/chart: {{ include "go-echob5d7ae99-6ffa-4a4c-a81a-e1cf4ba6cfa0.chart" . }}
{{ include "go-echob5d7ae99-6ffa-4a4c-a81a-e1cf4ba6cfa0.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob5d7ae99-6ffa-4a4c-a81a-e1cf4ba6cfa0.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob5d7ae99-6ffa-4a4c-a81a-e1cf4ba6cfa0.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}