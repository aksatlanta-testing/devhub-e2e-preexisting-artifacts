
{{- define "go-echo4425877a-239c-41c1-9660-1952c85dd2ae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4425877a-239c-41c1-9660-1952c85dd2ae.fullname" -}}
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


{{- define "go-echo4425877a-239c-41c1-9660-1952c85dd2ae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4425877a-239c-41c1-9660-1952c85dd2ae.labels" -}}
helm.sh/chart: {{ include "go-echo4425877a-239c-41c1-9660-1952c85dd2ae.chart" . }}
{{ include "go-echo4425877a-239c-41c1-9660-1952c85dd2ae.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4425877a-239c-41c1-9660-1952c85dd2ae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4425877a-239c-41c1-9660-1952c85dd2ae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}