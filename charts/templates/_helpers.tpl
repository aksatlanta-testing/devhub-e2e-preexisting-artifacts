
{{- define "go-echofb0d85a3-ef6e-4554-816e-e03dcd8ce098.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb0d85a3-ef6e-4554-816e-e03dcd8ce098.fullname" -}}
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


{{- define "go-echofb0d85a3-ef6e-4554-816e-e03dcd8ce098.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb0d85a3-ef6e-4554-816e-e03dcd8ce098.labels" -}}
helm.sh/chart: {{ include "go-echofb0d85a3-ef6e-4554-816e-e03dcd8ce098.chart" . }}
{{ include "go-echofb0d85a3-ef6e-4554-816e-e03dcd8ce098.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofb0d85a3-ef6e-4554-816e-e03dcd8ce098.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofb0d85a3-ef6e-4554-816e-e03dcd8ce098.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}