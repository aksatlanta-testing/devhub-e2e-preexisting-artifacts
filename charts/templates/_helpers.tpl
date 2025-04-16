
{{- define "go-echo7403b498-67e1-403f-b913-b0f30787060d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7403b498-67e1-403f-b913-b0f30787060d.fullname" -}}
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


{{- define "go-echo7403b498-67e1-403f-b913-b0f30787060d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7403b498-67e1-403f-b913-b0f30787060d.labels" -}}
helm.sh/chart: {{ include "go-echo7403b498-67e1-403f-b913-b0f30787060d.chart" . }}
{{ include "go-echo7403b498-67e1-403f-b913-b0f30787060d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7403b498-67e1-403f-b913-b0f30787060d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7403b498-67e1-403f-b913-b0f30787060d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}