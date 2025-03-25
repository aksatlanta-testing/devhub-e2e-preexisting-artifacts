
{{- define "go-echode3e83d4-9701-41a9-9c76-810065415932.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echode3e83d4-9701-41a9-9c76-810065415932.fullname" -}}
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


{{- define "go-echode3e83d4-9701-41a9-9c76-810065415932.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echode3e83d4-9701-41a9-9c76-810065415932.labels" -}}
helm.sh/chart: {{ include "go-echode3e83d4-9701-41a9-9c76-810065415932.chart" . }}
{{ include "go-echode3e83d4-9701-41a9-9c76-810065415932.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echode3e83d4-9701-41a9-9c76-810065415932.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echode3e83d4-9701-41a9-9c76-810065415932.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}