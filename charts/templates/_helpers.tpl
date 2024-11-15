
{{- define "go-echo989a6530-c9d6-476e-a614-f98fb9fdf108.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo989a6530-c9d6-476e-a614-f98fb9fdf108.fullname" -}}
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


{{- define "go-echo989a6530-c9d6-476e-a614-f98fb9fdf108.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo989a6530-c9d6-476e-a614-f98fb9fdf108.labels" -}}
helm.sh/chart: {{ include "go-echo989a6530-c9d6-476e-a614-f98fb9fdf108.chart" . }}
{{ include "go-echo989a6530-c9d6-476e-a614-f98fb9fdf108.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo989a6530-c9d6-476e-a614-f98fb9fdf108.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo989a6530-c9d6-476e-a614-f98fb9fdf108.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}