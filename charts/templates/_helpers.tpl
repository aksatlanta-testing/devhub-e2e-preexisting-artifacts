
{{- define "go-echo62dad81d-aaff-46ad-a6c8-c9dacace582e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo62dad81d-aaff-46ad-a6c8-c9dacace582e.fullname" -}}
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


{{- define "go-echo62dad81d-aaff-46ad-a6c8-c9dacace582e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo62dad81d-aaff-46ad-a6c8-c9dacace582e.labels" -}}
helm.sh/chart: {{ include "go-echo62dad81d-aaff-46ad-a6c8-c9dacace582e.chart" . }}
{{ include "go-echo62dad81d-aaff-46ad-a6c8-c9dacace582e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo62dad81d-aaff-46ad-a6c8-c9dacace582e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo62dad81d-aaff-46ad-a6c8-c9dacace582e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}