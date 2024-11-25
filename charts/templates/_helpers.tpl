
{{- define "go-echo7fdb7746-009d-42a1-b61e-e32f176e21cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7fdb7746-009d-42a1-b61e-e32f176e21cb.fullname" -}}
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


{{- define "go-echo7fdb7746-009d-42a1-b61e-e32f176e21cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7fdb7746-009d-42a1-b61e-e32f176e21cb.labels" -}}
helm.sh/chart: {{ include "go-echo7fdb7746-009d-42a1-b61e-e32f176e21cb.chart" . }}
{{ include "go-echo7fdb7746-009d-42a1-b61e-e32f176e21cb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7fdb7746-009d-42a1-b61e-e32f176e21cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7fdb7746-009d-42a1-b61e-e32f176e21cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}