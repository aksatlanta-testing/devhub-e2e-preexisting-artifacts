
{{- define "go-echo5e796c07-3681-407b-9865-8068e09db79e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5e796c07-3681-407b-9865-8068e09db79e.fullname" -}}
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


{{- define "go-echo5e796c07-3681-407b-9865-8068e09db79e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5e796c07-3681-407b-9865-8068e09db79e.labels" -}}
helm.sh/chart: {{ include "go-echo5e796c07-3681-407b-9865-8068e09db79e.chart" . }}
{{ include "go-echo5e796c07-3681-407b-9865-8068e09db79e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5e796c07-3681-407b-9865-8068e09db79e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5e796c07-3681-407b-9865-8068e09db79e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}