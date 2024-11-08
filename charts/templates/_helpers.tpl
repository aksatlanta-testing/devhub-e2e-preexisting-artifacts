
{{- define "go-echo396bc7e8-a325-4921-a57e-033fbdb94302.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo396bc7e8-a325-4921-a57e-033fbdb94302.fullname" -}}
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


{{- define "go-echo396bc7e8-a325-4921-a57e-033fbdb94302.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo396bc7e8-a325-4921-a57e-033fbdb94302.labels" -}}
helm.sh/chart: {{ include "go-echo396bc7e8-a325-4921-a57e-033fbdb94302.chart" . }}
{{ include "go-echo396bc7e8-a325-4921-a57e-033fbdb94302.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo396bc7e8-a325-4921-a57e-033fbdb94302.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo396bc7e8-a325-4921-a57e-033fbdb94302.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}