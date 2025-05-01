
{{- define "go-echo239c22da-0a0f-41b9-8f2e-a41fb6aed8ea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo239c22da-0a0f-41b9-8f2e-a41fb6aed8ea.fullname" -}}
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


{{- define "go-echo239c22da-0a0f-41b9-8f2e-a41fb6aed8ea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo239c22da-0a0f-41b9-8f2e-a41fb6aed8ea.labels" -}}
helm.sh/chart: {{ include "go-echo239c22da-0a0f-41b9-8f2e-a41fb6aed8ea.chart" . }}
{{ include "go-echo239c22da-0a0f-41b9-8f2e-a41fb6aed8ea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo239c22da-0a0f-41b9-8f2e-a41fb6aed8ea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo239c22da-0a0f-41b9-8f2e-a41fb6aed8ea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}