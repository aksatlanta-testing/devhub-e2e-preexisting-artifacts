
{{- define "go-echo7a13381c-2a67-4dc9-b9c4-2213ef2a5dae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7a13381c-2a67-4dc9-b9c4-2213ef2a5dae.fullname" -}}
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


{{- define "go-echo7a13381c-2a67-4dc9-b9c4-2213ef2a5dae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7a13381c-2a67-4dc9-b9c4-2213ef2a5dae.labels" -}}
helm.sh/chart: {{ include "go-echo7a13381c-2a67-4dc9-b9c4-2213ef2a5dae.chart" . }}
{{ include "go-echo7a13381c-2a67-4dc9-b9c4-2213ef2a5dae.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7a13381c-2a67-4dc9-b9c4-2213ef2a5dae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7a13381c-2a67-4dc9-b9c4-2213ef2a5dae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}