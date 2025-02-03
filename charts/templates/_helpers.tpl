
{{- define "go-echo2119bb6d-72fd-4f6e-8985-b9188b50755c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2119bb6d-72fd-4f6e-8985-b9188b50755c.fullname" -}}
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


{{- define "go-echo2119bb6d-72fd-4f6e-8985-b9188b50755c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2119bb6d-72fd-4f6e-8985-b9188b50755c.labels" -}}
helm.sh/chart: {{ include "go-echo2119bb6d-72fd-4f6e-8985-b9188b50755c.chart" . }}
{{ include "go-echo2119bb6d-72fd-4f6e-8985-b9188b50755c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2119bb6d-72fd-4f6e-8985-b9188b50755c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2119bb6d-72fd-4f6e-8985-b9188b50755c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}