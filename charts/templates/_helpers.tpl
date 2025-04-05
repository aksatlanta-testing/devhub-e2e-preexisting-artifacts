
{{- define "go-echo826e511a-5623-4876-bd4c-3375eaf1407c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo826e511a-5623-4876-bd4c-3375eaf1407c.fullname" -}}
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


{{- define "go-echo826e511a-5623-4876-bd4c-3375eaf1407c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo826e511a-5623-4876-bd4c-3375eaf1407c.labels" -}}
helm.sh/chart: {{ include "go-echo826e511a-5623-4876-bd4c-3375eaf1407c.chart" . }}
{{ include "go-echo826e511a-5623-4876-bd4c-3375eaf1407c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo826e511a-5623-4876-bd4c-3375eaf1407c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo826e511a-5623-4876-bd4c-3375eaf1407c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}