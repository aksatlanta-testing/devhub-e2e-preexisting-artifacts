
{{- define "go-echo6b11385c-9962-418f-99af-aaeb48a0940e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6b11385c-9962-418f-99af-aaeb48a0940e.fullname" -}}
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


{{- define "go-echo6b11385c-9962-418f-99af-aaeb48a0940e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6b11385c-9962-418f-99af-aaeb48a0940e.labels" -}}
helm.sh/chart: {{ include "go-echo6b11385c-9962-418f-99af-aaeb48a0940e.chart" . }}
{{ include "go-echo6b11385c-9962-418f-99af-aaeb48a0940e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6b11385c-9962-418f-99af-aaeb48a0940e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6b11385c-9962-418f-99af-aaeb48a0940e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}