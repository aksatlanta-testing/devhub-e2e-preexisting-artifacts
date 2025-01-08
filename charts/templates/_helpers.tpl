
{{- define "go-echoe56b109e-f567-4c31-9c1f-cd046a1c488d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe56b109e-f567-4c31-9c1f-cd046a1c488d.fullname" -}}
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


{{- define "go-echoe56b109e-f567-4c31-9c1f-cd046a1c488d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe56b109e-f567-4c31-9c1f-cd046a1c488d.labels" -}}
helm.sh/chart: {{ include "go-echoe56b109e-f567-4c31-9c1f-cd046a1c488d.chart" . }}
{{ include "go-echoe56b109e-f567-4c31-9c1f-cd046a1c488d.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe56b109e-f567-4c31-9c1f-cd046a1c488d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe56b109e-f567-4c31-9c1f-cd046a1c488d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}