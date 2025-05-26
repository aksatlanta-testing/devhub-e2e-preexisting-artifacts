
{{- define "go-echo5b497c4b-a8b6-43ee-8333-9d6f599ce437.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5b497c4b-a8b6-43ee-8333-9d6f599ce437.fullname" -}}
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


{{- define "go-echo5b497c4b-a8b6-43ee-8333-9d6f599ce437.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5b497c4b-a8b6-43ee-8333-9d6f599ce437.labels" -}}
helm.sh/chart: {{ include "go-echo5b497c4b-a8b6-43ee-8333-9d6f599ce437.chart" . }}
{{ include "go-echo5b497c4b-a8b6-43ee-8333-9d6f599ce437.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5b497c4b-a8b6-43ee-8333-9d6f599ce437.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5b497c4b-a8b6-43ee-8333-9d6f599ce437.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}