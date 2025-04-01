
{{- define "go-echoc665b7ba-6f94-4b71-b2a2-0348ba83ac6d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc665b7ba-6f94-4b71-b2a2-0348ba83ac6d.fullname" -}}
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


{{- define "go-echoc665b7ba-6f94-4b71-b2a2-0348ba83ac6d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc665b7ba-6f94-4b71-b2a2-0348ba83ac6d.labels" -}}
helm.sh/chart: {{ include "go-echoc665b7ba-6f94-4b71-b2a2-0348ba83ac6d.chart" . }}
{{ include "go-echoc665b7ba-6f94-4b71-b2a2-0348ba83ac6d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc665b7ba-6f94-4b71-b2a2-0348ba83ac6d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc665b7ba-6f94-4b71-b2a2-0348ba83ac6d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}